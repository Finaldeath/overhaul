// * warn the player that they are entering a dangerous area
void main()
{
    if (GetLocalInt(OBJECT_SELF, "X2_L_DOONCE") == 0)
    {
        object oEnter = GetEnteringObject();
        if (GetIsPC(oEnter) == TRUE)
        {
            AssignCommand(oEnter, ClearAllActions(TRUE));
            ActionStartConversation(oEnter, "bk_shaker_warn");
            SetLocalInt(OBJECT_SELF, "X2_L_DOONCE",10);
        }
    }
}
