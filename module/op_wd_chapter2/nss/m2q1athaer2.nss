// * Take Shaldrissa's False Journal from the Player
#include "nw_i0_plot"

void main()
{
    AutoAlignG(DC_HARD, GetPCSpeaker());
	ActionTakeItem(GetObjectByTag("M2Q1ITJOURNSHALF"),GetLastSpeaker());
}
