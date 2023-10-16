//q1foot_use_rumga
//if rumgut is asleep when the debris is checked - create the key there
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nKeyTaken") != 1)
    {
        object oRumgut = GetObjectByTag("q1foot_rumgut");
        if (GetLocalInt(oRumgut, "X1_RumgutDrunk") == 1 || GetLocalInt(GetModule(), "X1_nRumgutSleep") == 1 || GetLocalInt(GetModule(), "X1_Q1RuralRebPoison") == 2)
            CreateItemOnObject("q1rumgutkey");
    }
}
