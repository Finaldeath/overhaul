void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 115:
            object oWP = GetWaypointByTag("WP_M1Q1APyre");
            ActionMoveToObject(oWP);
            ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW);
            ActionDoCommand(SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(116)));
            ActionWait(10.0f);
            ActionEquipItem(GetItemPossessedBy(OBJECT_SELF,"NW_IT_TORCH001"),INVENTORY_SLOT_LEFTHAND);
            ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW);
            ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT,
                                                  EffectVisualEffect(VFX_IMP_FLAME_M),
                                                  GetLocation(GetWaypointByTag("WP_M1Q1ABody"))));
            ActionDoCommand(SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(117)));
            ActionWait(10.0f);
            ActionMoveToObject(GetWaypointByTag("WP_PyreStart"));
            ActionDoCommand(DestroyObject(OBJECT_SELF));
        break;
    }

}
