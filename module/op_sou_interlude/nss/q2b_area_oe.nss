// Al-Rashid's tomb on-enter: petrify statues

void Petrify(object oObject)
{
    SetImmortal(oObject, FALSE);
    effect eStone = EffectPetrify();
    ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oObject));
    DelayCommand(2.0, SetImmortal(oObject, TRUE));
}

// return TRUE if oObject is on oTrigger, FALSE otherwise.
int ObjectOnTrigger(object oTrigger, object oObject)
{
    // make sure that not handling other placeables than the runes
    if(GetObjectType(oObject) == OBJECT_TYPE_PLACEABLE && GetTag(oObject) != "Q2B_RUNE_PLACE")
        return FALSE;
    object oInside = GetFirstInPersistentObject(oTrigger, GetObjectType(oObject));
    while(oInside != OBJECT_INVALID)
    {
        if(oInside == oObject)
            return TRUE;
        oInside = GetNextInPersistentObject(oTrigger, GetObjectType(oObject));
    }
    return FALSE;
}

void main()
{
    object oEnter = GetEnteringObject();
    // check the last trigger that this object was on before the save/load game
    object oTrigger = GetLocalObject(OBJECT_SELF, "Q2B_ON_PLATE" + ObjectToString(oEnter));
    if(oTrigger != OBJECT_INVALID)
    {
        int nCount = GetLocalInt(oTrigger, "ENTER_COUNT");
        nCount--;
        if(!ObjectOnTrigger(oTrigger, oEnter))
            SignalEvent(oTrigger, EventUserDefined(102)); // an associate that jumped after the load
        else
            SetLocalInt(oTrigger, "ENTER_COUNT", nCount); // update the count
    }
    //if(GetLocalInt(GetArea(OBJECT_SELF), "Q2B_PLATES_STATUS") != 0)
    //    HandlePlatesStatus(oEnter);
    if(GetIsDead(oEnter) || GetTag(oEnter) == "NW_GARGOYLE")
        return;

    object oSacr = GetObjectByTag("Q2B_SAC"); // just as a center for looking for the statues
    object oGarg1 = GetNearestObjectByTag("NW_GARGOYLE", oSacr, 1);
    object oGarg2 = GetNearestObjectByTag("NW_GARGOYLE", oSacr, 2);
    object oGarg3 = GetNearestObjectByTag("NW_GARGOYLE", oSacr, 3);
    object oGarg4 = GetNearestObjectByTag("NW_GARGOYLE", oSacr, 4);

    if(GetLocalInt(oGarg1, "DO_ANIMATE_ONCE") == 1)
        return;
    Petrify(oGarg1);
    Petrify(oGarg2);
    Petrify(oGarg3);
    Petrify(oGarg4);
}
