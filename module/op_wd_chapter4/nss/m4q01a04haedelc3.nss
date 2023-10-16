///// Set status of main plot globabl (NW_G_M4Q01PLOTSOURCE_STONE) to 1 (PC told to go into source stone)
///// Source stones recovered, PC marked as one who brought sourcestones back,

#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(),"NW_G_M4Q01PLOTSOURCE_STONE",1);
    SetLocalObject(OBJECT_SELF,"M4Q01CWORD_PC",GetPCSpeaker());
    SetCustomToken(4001,GetName(GetPCSpeaker()));
    RewardXP("M4Q01_MAIN",100,GetPCSpeaker());
    AddJournalQuestEntry("M4Q01_MAIN",30,GetPCSpeaker(), TRUE,TRUE);
}
