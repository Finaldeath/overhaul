// have stingers run away from the room if the manticore is still alive

void main()
{
    object oEnter = GetEnteringObject();
    object oWP = GetNearestObjectByTag("Q1_WP_AVOID", oEnter);
    object oWPJump = GetNearestObjectByTag("Q1_WP_JUMP_AVOID", oEnter);
    object oManticore = GetNearestObjectByTag("Q1_MANTICORE");
    if(GetRacialType(oEnter) == RACIAL_TYPE_HUMANOID_MONSTROUS &&
        GetTag(oEnter) != "Q1_STINGER_ARC3" &&
        !GetIsDead(oManticore))
    {
        AssignCommand(oEnter, JumpToObject(oWPJump));
        AssignCommand(oEnter, ClearAllActions());
        AssignCommand(oEnter, ActionMoveToObject(oWP, TRUE));
        AssignCommand(oEnter, ActionDoCommand(SetCommandable(TRUE, oEnter)));
        //SetCommandable(FALSE, oEnter);
    }
}
