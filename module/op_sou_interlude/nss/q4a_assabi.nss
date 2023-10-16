// jump assabi away - so they won't enter the area with Huerodis

void main()
{
    object oWPJump = GetNearestObjectByTag("Q4A_WP_ASSABI_JUMP");
    object oWPWalk = GetNearestObjectByTag("Q4A_WP_ASSABI_WALK");

    object oEnter = GetEnteringObject();

    if(GetStringLeft(GetTag(oEnter), 8) == "X0_ASABI")
    {
        AssignCommand(oEnter, ClearAllActions());
        AssignCommand(oEnter, JumpToObject(oWPJump));
        AssignCommand(oEnter, ActionMoveToObject(oWPWalk, TRUE));
    }

}
