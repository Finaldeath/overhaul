void main()
{
if(  (GetLocalInt(GetArea(OBJECT_SELF),"M2Q2SpiderMotherCall") == 1) &&
    (GetDistanceToObject(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)) > 10.0))
    {
        ClearAllActions();
        ActionMoveToObject(GetObjectByTag("M2Q2CSPIDMOTHER"),1);
    }
}
