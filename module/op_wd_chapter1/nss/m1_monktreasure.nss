#include "M1_Plot"
void main()
{
    object oPC = GetLastOpenedBy();
    if(GetLevelByClass(CLASS_TYPE_MONK,oPC) > 0 &&
       GetLocalInt(OBJECT_SELF,"NW_L_OpenedByMonk") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_OpenedByMonk",TRUE);
        GiveMonkTreasure(oPC);
    }
}
