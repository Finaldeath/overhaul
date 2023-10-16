int StartingConditional()
{
    //if rumgut is asleep and rebecca hasn't been freed yet and the cage isn't open and the PC has the key
    object oRumgut = GetObjectByTag("q1foot_rumgut");
    if ((GetLocalInt(oRumgut, "X1_RumgutDrunk") == 1 || GetLocalInt(GetModule(), "X1_nRumgutSleep") == 1 || GetIsObjectValid(oRumgut) == FALSE) && GetLocalInt(GetModule(), "X1_RebeccaFree") != 1 && GetObjectByTag("q1rumgutcage1") != OBJECT_INVALID && GetItemPossessedBy(GetPCSpeaker(), "q1rumgutkey")!= OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
