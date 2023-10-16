// Weapon Spirit trigger:
// - Close and lock the door
// - Knockdown player
// - Bring spirit and give it the player's weapon

void Bring(object oObject, object oPC)
{
    AssignCommand(oObject, ClearAllActions());
    AssignCommand(oObject, JumpToObject(oPC));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    // Close and lock the door
    object oDoor = GetNearestObjectByTag("q4b_spirit_door");
    AssignCommand(oDoor, ActionCloseDoor(oDoor));
    SetLocked(oDoor, TRUE);

    // Bring in all associates
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    Bring(oAnimal, oPC);
    Bring(oDominated, oPC);
    Bring(oFamiliar, oPC);
    Bring(oSummoned, oPC);

    int i = 1;
    object oHenchman = GetHenchman(oPC, i);
    while(oHenchman != OBJECT_INVALID)
    {
        Bring(oHenchman, oPC);
        i++;
        oHenchman = GetHenchman(oPC, i);
    }

    // Knockdown the player
    effect eKnock = EffectKnockdown();
    AssignCommand(oPC, ClearAllActions());
    effect eImp = EffectVisualEffect(VFX_IMP_TORNADO);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oPC);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oPC, 2.0));
    object oWP = GetWaypointByTag("q4b_wp_spirit_sp");
    object oSpirit = GetNearestObjectByTag("q4b_WeaponSpirit");
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
    effect eSpeed = EffectMovementSpeedIncrease(99);


    object oItemLeft = GetLocalObject(oPC, "Q4B_LEFT");
    object oItemRight = GetLocalObject(oPC, "Q4B_RIGHT");
    object oNewRight;
    object oNewLeft;

    object oHammer = GetObjectByTag("MerkilsHammer");

    if(oItemRight == OBJECT_INVALID)
    {
        oItemRight = oHammer;
        DelayCommand(1.5, AssignCommand(oSpirit, JumpToObject(oWP)));
    }
    else // appear near player and move away to start location
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeed, oSpirit, 3.0);
        DelayCommand(1.0, AssignCommand(oSpirit, JumpToObject(oPC)));
        DelayCommand(1.5, AssignCommand(oSpirit, ActionMoveToObject(oWP, TRUE, 0.0)));
    }
    oNewRight = CopyObject(oItemRight, GetLocation(oSpirit), oSpirit);
    DestroyObject(oItemRight, 1.5);
    if(oItemLeft != OBJECT_INVALID)
    {
        oNewLeft = CopyObject(oItemLeft, GetLocation(oSpirit), oSpirit);
        DestroyObject(oItemLeft, 1.5);
    }
    AssignCommand(oSpirit, ActionEquipItem(oNewRight, INVENTORY_SLOT_RIGHTHAND));
    AssignCommand(oSpirit, ActionEquipItem(oNewLeft, INVENTORY_SLOT_LEFTHAND));

    DelayCommand(5.0, AssignCommand(oSpirit, ActionAttack(oPC)));


}
