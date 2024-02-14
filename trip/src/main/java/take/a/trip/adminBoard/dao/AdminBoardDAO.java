package take.a.trip.adminBoard.dao;

import java.util.List;

import take.a.trip.adminBoard.vo.AdminBoardVO;
import take.a.trip.spot.vo.SpotVO;

public interface AdminBoardDAO {
	
	public int adminBoardInsert(AdminBoardVO abvo);
	
	public List<AdminBoardVO> adminBoardSelectAll(AdminBoardVO abvo);
	public List<AdminBoardVO> adminBoardSelect(AdminBoardVO abvo);
	public List<AdminBoardVO> adminBoardUpdateForm(AdminBoardVO abvo);
	
	// 게시글 조회 수 
	public int adminBoardHits(AdminBoardVO abvo);
	
	public int adminBoardUpdate(AdminBoardVO abvo);
	public int adminBoardDelete(AdminBoardVO abvo);
	
	// 검색
	public List<AdminBoardVO> admin_SearchSelect(AdminBoardVO abvo);
	
}
