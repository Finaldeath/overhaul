//::///////////////////////////////////////////////
//:: Name h4b_backup
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will ensure that the mimic will be in
     the right spot for the cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 8, 2003
//:://////////////////////////////////////////////
#include "mimic_inc"
void StartCutscene(object oPC, int iCut);

void main()
{
    object oPC = GetEnteringObject();
    object oMimic = GetObjectByTag("hx_mimic");
    location lLoc = GetLocation(GetObjectByTag("h4b_mimic_final_wp"));

    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

        // Turn the Mimic AI off and jump him into place.
        SetMimicAI(oMimic, 0);
        AssignCommand(oMimic, JumpToLocation(lLoc));
    }
}
