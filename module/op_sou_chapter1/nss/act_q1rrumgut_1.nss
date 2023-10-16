//rumgut moves to the fire and faces the nearest PC
void main()
{
    ActionMoveToObject(GetWaypointByTag("wp_rumgut_post"));
    DelayCommand(4.0, SetFacingPoint(GetPosition(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC))));
}
