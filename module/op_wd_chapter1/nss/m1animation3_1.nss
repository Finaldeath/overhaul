void main()
{
    if(IsInConversation(OBJECT_SELF) == FALSE)
    {
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
        ActionPlayAnimation(ANIMATION_LOOPING_LISTEN);
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
        ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("WP_GroupFacing"))));
    }

}
