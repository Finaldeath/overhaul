#include "NW_I0_Henchman"
void main()
{
    object oEnter = GetEnteringObject();
    if(GetIsPC(oEnter))
    {
        SpawnHenchman();
    }
    if(GetLocalInt(GetModule(),"NW_G_M2Q4A_AUTOSAVE")==0 && GetIsPC(oEnter))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M2Q4A_AUTOSAVE",1);
    }
}
