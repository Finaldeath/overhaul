#include "achievement_lib"
void main()
{

    object oPC = GetPCSpeaker();
    PlotAchievement(oPC, 0);
    SetLocalInt(GetModule(),"NW_G_M1Q0End",TRUE);

}
