//::///////////////////////////////////////////////
//:: Name act_q6deekin_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Have Deekin run off and disappear
he is still invulnerable so the player can't hurt him really
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: mar 5/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    ActionMoveAwayFromObject(oPC, TRUE);
    SetCommandable(FALSE);
    DestroyObject(OBJECT_SELF, 5.0);
}
