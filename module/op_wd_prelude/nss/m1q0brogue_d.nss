void main()
{
 /*   if(IsInConversation(OBJECT_SELF) == FALSE)
    {
        SetFacingPoint(GetPosition(GetNearestObjectByTag("WP_GroupFacing")));
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
        ActionPlayAnimation(ANIMATION_LOOPING_LISTEN);
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
    }*/
    if(IsInConversation(OBJECT_SELF) == FALSE)
    {
        ActionUseSkill(SKILL_PICK_POCKET,GetNearestObjectByTag("M1Q0BStealTarget"));
    }
}
