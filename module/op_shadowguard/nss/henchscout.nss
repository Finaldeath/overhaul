void main()
{
    object oClosest =  GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY,
                        OBJECT_SELF, 1);
    if (GetIsObjectValid(oClosest)) {
        SetLocalInt(OBJECT_SELF,"Scouting",TRUE);
        SetLocalObject(OBJECT_SELF,"ScoutTarget",oClosest);
        ClearAllActions();
        ActionForceFollowObject(oClosest,1.0);
        ActionForceFollowObject(oClosest,1.0);
        ActionForceFollowObject(oClosest,1.0);
    } else
        SetLocalInt(OBJECT_SELF,"Scouting",FALSE);
}
