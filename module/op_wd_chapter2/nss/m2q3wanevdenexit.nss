void main()
{
    object oEntered = GetEnteringObject();
    object oWaypoint = GetWaypointByTag("WP_WANEVDENEXIT");
    object oPortal = GetObjectByTag("WP_WANEVDENENTER");
    location lPortal = GetLocation(oPortal);

    if (GetIsPC(oEntered) &&
        GetLocalInt(GetArea(OBJECT_SELF),"NW_A_PortalInUse") == 0)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_PortalInUse",10);
        DelayCommand(3.0,SetLocalInt(GetArea(OBJECT_SELF),"NW_A_PortalInUse",0));
        AssignCommand(oEntered,ClearAllActions());
        DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),lPortal));
        AssignCommand(oEntered,ActionMoveToObject(oPortal,FALSE,0.1));
        AssignCommand(oEntered,DelayCommand(2.0,JumpToObject(oWaypoint)));
        AssignCommand(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oEntered),DelayCommand(1.0,JumpToObject(oWaypoint)));
        AssignCommand(GetAssociate(ASSOCIATE_TYPE_DOMINATED,oEntered),DelayCommand(1.0,JumpToObject(oWaypoint)));
        AssignCommand(GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oEntered),DelayCommand(1.0,JumpToObject(oWaypoint)));
        AssignCommand(GetAssociate(ASSOCIATE_TYPE_HENCHMAN,oEntered),DelayCommand(1.0,JumpToObject(oWaypoint)));
        AssignCommand(GetAssociate(ASSOCIATE_TYPE_SUMMONED,oEntered),DelayCommand(1.0,JumpToObject(oWaypoint)));
        DelayCommand(2.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWSTUN),oEntered));
    }
}
