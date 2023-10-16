void main()
{
    object oNoticed = GetLastPerceived();
    object oTarget = GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack");
    if(GetIsObjectValid(oNoticed))
    {
        if (GetLastPerceptionSeen() &&
            GetIsEnemy(oNoticed) &&
            !GetIsObjectValid(oTarget))
        {
            ClearAllActions();
            //SetListening(OBJECT_SELF,FALSE);
            ActionAttack(oNoticed);
            SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",oNoticed);
        }
        else if(GetLastPerceptionVanished() &&
                 GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack") == oNoticed)
        {
            SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",OBJECT_INVALID);
            ClearAllActions();
        }
    }
}
