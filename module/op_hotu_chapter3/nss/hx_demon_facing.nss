//::///////////////////////////////////////////////
//:: Name hx_demon_facing
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adjust demon facing from flying in.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oDemon = GetObjectByTag("hx_hand_demon");

    AssignCommand(oDemon, SetFacingPoint(GetPosition(oPC)));
}
