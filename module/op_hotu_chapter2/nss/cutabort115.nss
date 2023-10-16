//::///////////////////////////////////////////////
//:: Name cutabort115
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of betrayal of the Seer's Death
    Game over for the PC
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 25/03
//:://////////////////////////////////////////////
void JumpToDestination(object oPC);
void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);

    BlackScreen(oPC);
    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FAST));

    JumpToDestination(oPC);

}

void JumpToDestination(object oPC)
{
    string szWaypoint = GetLocalString(oPC, "X2_BoatmanModule");
    AssignCommand(oPC, JumpToObject(GetWaypointByTag(szWaypoint)));


}
