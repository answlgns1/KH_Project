package com.kh.summer.user.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.summer.common.exception.MemberException;
import com.kh.summer.common.mail.MailService;
import com.kh.summer.user.member.model.service.MemberService;
import com.kh.summer.user.member.model.vo.Member;

@SessionAttributes(value = { "member" }) // 모델에 member를 담을시 세션에 자동으로 등록
@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailService mailService;
 	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "user/member/memberEnroll";
	}

	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(@RequestParam String userId, @RequestParam String nickName,
								  @RequestParam String password, @RequestParam String userName,
								  @RequestParam String birth, @RequestParam String gender,
								  @RequestParam String phone, @RequestParam String email,
								  @RequestParam String address1, @RequestParam String address2,
								  Model model) {
		
		String address = address1 + address2;
		
		Member member = new Member(userId, password, nickName, userName, gender, birth, email, phone, address);
		
		System.out.println("memberEnroll : " + member);
		
		String plainPassword = member.getPassword();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		member.setPassword(encryptPassword);
		
		try {
			// 1. 서비스를 통한 비즈니스 로직 수행
			int result = memberService.insertMember(member);
			
			// 2. 처리 결과에 따라 view 분기 처리
			String loc = "/";
			String msg = "";
			
			if(result > 0) {
				msg = "회원가입 성공!";
			} else {
				msg = "회원가입 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println("회원 가입 에러 발생!!");
			
			// 기존은 예외를 우리가 지정한 예외 형식으로
			// 바꾸어 보내기 위해 MemberException을 호출한다.
			throw new MemberException(e.getMessage());
		}
		
		return "common/msg";
	}

	// 로그인
	@RequestMapping("/member/memberLogin.do")
	public ModelAndView memberLogin(
				@RequestParam String userId,
				@RequestParam String password) {
		
		ModelAndView mv = new ModelAndView();
		
		String loc = "/";
		String msg = "";
		
		Member m = memberService.selectOneMember(userId);
		
		if( m == null ) {
			msg = "존재하지 않는 아이디 입니다.";
		} else if( m.getMstatus().equals("N") ) {
			msg = "탈퇴한 아이디입니다.";
		} else {
			// if(password.equals(m.getPassword())) { // 암호화 안한거(임시)
			if( bcryptPasswordEncoder.matches(password, m.getPassword()) ) { // 입력 값과 암호화 값을 비교
				msg = "로그인에 성공하였습니다!";
				mv.addObject("member", m);
				// @SessionAttributes 어노테이션에 등록된 'member'로 인식하면서
				// 자동으로 세션 영역에 해당 객체를 저장한다.
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}
		
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		
		// 현재 세션이 만료되었음을
		// HttpSession 에서 invalidate() 메소드로 구현했다면
		// SessionStatus 는 .setComplete() 메소드로 구현한다.
		
		if( !sessionStatus.isComplete() ) { // 끝나지 않았다면
			sessionStatus.setComplete();
		}
		
		return "redirect:/";
	}
	
	/**
	 * 회원정보 수정 페이지
	 * @param userId
	 * @return String
	 */
	@RequestMapping("/member/mUpdate.do")
	public String memberView(@RequestParam String userId, Model model) {
		
		Member m = memberService.selectOneMember(userId);
		
		model.addAttribute("member", m);
		
		return "user/member/memberUpdate";
	}
	
	/**
	 * 회원정보 수정완료
	 * @param userId
	 * @return String
	 */
	@RequestMapping("/member/mUpdateEnd.do")
	public String memberUpdate(@RequestParam String userId,
							   @RequestParam(value="password", required = false) String password,
							   @RequestParam String nickName,
							   @RequestParam String email,
							   @RequestParam String phone,
							   @RequestParam(value="address1", required = false) String address1,
							   @RequestParam(value="address2", required = false) String address2,
							   Model model) {
		
		String address = address1 + " " + address2;
		
		Member member = new Member(userId, password, nickName, email, phone, address);
		
		String plainPassword = member.getPassword();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		member.setPassword(encryptPassword);
		
		System.out.println(member);
		
		int result = memberService.updateMember(member);
		
		String msg = "";
		
		if( result > 0 ) {
			msg = "회원정보 수정 완료";
		} else {
			msg = "회원정보 수정 실패!";
		}
		
		System.out.println(msg);
		
		model.addAttribute("msg", msg);
		
		return "user/myPage/myPageCart";
	}
	
	/**
	 * 회원탈퇴
	 * @param sessionStatus
	 * @return String
	 */
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(SessionStatus sessionStatus, Model model, Member member) {
		
		int result = memberService.deleteMember(member.getUserId());
		
		if( result > 0 ) sessionStatus.setComplete();
		
		String loc = "/";
		String msg = "";
		
		if( result > 0 ) {
			msg = "회원 탈퇴 성공!!";
		} else {
			msg = "회원 탈퇴 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	/**
	 * 아이디 중복 체크
	 * @param userId
	 * @return map
	 */
	@ResponseBody // 자동으로 json으로 바꿔서 보내줌
	@RequestMapping("/member/checkIdDuplicate.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable
		= memberService.checkIdDuplicate(userId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	/**
	 * 닉네임 중복 체크
	 * @param nickName
	 * @return map
	 */
	@ResponseBody
	@RequestMapping("/member/nickNameDupChk.do")
	public Map<String, Object> nickChk(@RequestParam String nickName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable
			= memberService.nickNameDupChk(nickName) == 0 ? true : false;
	
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	/**
	 * 이메일 중복 체크
	 * @param email
	 * @return map
	 */
	@ResponseBody
	@RequestMapping("/member/emailCheck.do")
	public Map<String, Object> emailChk(@RequestParam String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable
			= memberService.emailDupChk(email) == 0 ? true : false;
	
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	/**
	 * 이메일 인증키 전송
	 * @param email
	 * @return 인증키
	 */
	@ResponseBody
	@RequestMapping("/member/sendMail.do")
	public String sendMail(@RequestParam String email, HttpSession session) {
		
		//인증 번호 생성기
	    StringBuffer key = new StringBuffer();
	    Random rnd = new Random();
	    for(int i=0;i<10;i++)
	    {
	        int rIndex = rnd.nextInt(3);
	        switch (rIndex) {
	        case 0:
	            // a-z
	            key.append((char) ((int) (rnd.nextInt(26)) + 97));
	            break;
	        case 1:
	            // A-Z
	            key.append((char) ((int) (rnd.nextInt(26)) + 65));
	            break;
	        case 2:
	            // 0-9
	            key.append((rnd.nextInt(10)));
	            break;
	        }
	    }
	    
	    System.out.println("key Generate : " + key);
	    
	    String subject = "[SUMMER] 이메일 인증코드입니다.";
	    StringBuilder sb = new StringBuilder();
	    sb.append("인증코드는 [ " + key + " ] 입니다.");
	  
		mailService.send(subject, sb.toString(), "summer13121312@gmail.com", email);
		
		return key.toString();
	}
	
	@RequestMapping("/member/findInfo.do")
	public String findInfoPage() {
		return "user/member/findInformation";
	}
	
	@RequestMapping("/member/findID.do")
	public String findID(Member member, Model model, SessionStatus sessionStatus) {
		
		String msg = "";
		String loc = "";
		
		Member result = memberService.findID(member);
		
		if( result == null ) { msg = "일치하는 정보가 없습니다."; }
		else { msg = "회원님의 아이디는 [ " + result.getUserId() + " ] 입니다."; }
		
		// Logout
		if( !sessionStatus.isComplete() ) { 
			sessionStatus.setComplete();
		}
		
		loc = "/";
		
		model.addAttribute("msg", msg)
			 .addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/member/findInfoCheck.do")
	public Map<String, Object> findInfoCheck(Member member) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean result
		= memberService.findInfoCheck(member) == 1 ? true : false;
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("/member/changePW.do")
	public String changePW(@RequestParam String userId,
						   SessionStatus sessionStatus, Model model) {
		
		model.addAttribute("userId", userId);
		
		if( !sessionStatus.isComplete() ) { 
			sessionStatus.setComplete();
		}
		
		return "user/member/changePW";
	}
	
	@RequestMapping("/member/changePwEnd.do")
	public String changePwEnd(@RequestParam String userId, @RequestParam String password,
							  SessionStatus sessionStatus, Model model) {
		
		Member member = new Member(userId, password);
		
		String plainPassword = member.getPassword();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		member.setPassword(encryptPassword);
		
		int result = memberService.changePW(member);
		
		String msg = "";
		String loc = "/";
		
		if( result > 0 ) {
			msg = "비밀번호 변경 완료";
		} else {
			msg = "비밀번호 변경 실패!";
		}
		
		// Logout
		if( !sessionStatus.isComplete() ) { 
			sessionStatus.setComplete();
		}
		
		model.addAttribute("msg", msg)
			 .addAttribute("loc", loc);
		
		return "common/msg";
	}
	
}
















