// place this script in the heartbeat of 2 or 3 NPCs standing together
// place a waypoint with the tag "WP_GroupFacing" in the midst of the NPCs
void main()
{
    if(IsInConversation(OBJECT_SELF) == FALSE)
    {
        ClearAllActions();
        ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("WP_GroupFacing"))));
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
        ActionPlayAnimation(ANIMATION_LOOPING_LISTEN);
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
    }
}
