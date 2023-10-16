// Abort script for cutscene 61 (Sabal uses the shard on a pillar)

#include "nw_i0_generic"

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    object oSabal = GetObjectByTag("q6_sabal");
    object oSabalWP = GetObjectByTag("q6f2_wp_sabal_start");
    object oCopyWP = GetWaypointByTag("q6f_wp_copy_sp");
    AssignCommand(oPC, ClearAllActions());
    DelayCommand(1.0, AssignCommand(oSabal, JumpToObject(oSabalWP)));
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(3.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    AdjustReputation(oSabal, oPC, -100);
    AdjustReputation(oPC, oSabal, -100);

    object oObject = GetFirstObjectInArea(GetArea(oPC));
    while(oObject != OBJECT_INVALID)
    {
        if(GetStringLeft(GetTag(oObject), 3) == "q6_" &&
            GetTag(oObject) != "q6_TheFool")
        {
            if(GetTag(oObject) != "q6_sabal")
                DelayCommand(3.0, AssignCommand(oObject, ActionMoveToObject(oPC, TRUE, 15.0)));
            DelayCommand(3.0, AssignCommand(oObject, ActionDoCommand(DetermineCombatRound(oPC))));
        }
        oObject = GetNextObjectInArea(GetArea(oPC));
    }
}
