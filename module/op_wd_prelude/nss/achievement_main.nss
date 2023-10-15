#include "nw_i0_henchman"
#include "achievement_lib"

void main()
{
    object oPlayer = GetFirstPC();
    while(GetIsObjectValid(oPlayer)){
        CheckAchievements(oPlayer, GetModule());
        oPlayer = GetNextPC();
    }
}
