//::///////////////////////////////////////////////
//:: Name act_q1becka_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Have Becka run off and disappear
she is still invulnerable so the player can't hurt her really.
Can set variable to know she is mad at PC..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: mar 5/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"X1_BECKAAMBUSH", 1);
    object oPC = GetPCSpeaker();
    ActionMoveAwayFromObject(oPC, TRUE);
    SetPlotFlag(OBJECT_SELF, TRUE);
    DestroyObject(OBJECT_SELF, 5.0);
}
