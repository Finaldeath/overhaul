//::///////////////////////////////////////////////
//:: FileName ischaotic
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/27/2002 4:08:58 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Restrict based on the player's alignment
    if(GetAlignmentLawChaos(GetPCSpeaker()) != ALIGNMENT_CHAOTIC)
        return FALSE;

    if(GetLocalInt(GetPCSpeaker(), "BlackMarket")) return FALSE;


    return TRUE;
}
