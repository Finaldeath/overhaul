// Heurodis ud events

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void TalkAgain(object oPC)
{
    ClearAllActions();
    ActionMoveToObject(oPC, FALSE, 1.0);
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}

void Teleport(object oPC)
{
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
    SetLocalObject(GetArea(OBJECT_SELF), "FOCUS_PC", oPC); // needed in the area ud event
    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101)); // focus on player
    DestroyObject(OBJECT_SELF);
}

// destroy the mythalar on any pc
void DestroyCrystal()
{
    object oPC = GetFirstPC();
    object oCrystal;
    while(oPC != OBJECT_INVALID)
    {
        oCrystal = GetItemPossessedBy(oPC, "x1towercrystal");
        if(oCrystal != OBJECT_INVALID)
            DestroyObject(oCrystal);
        oPC = GetNextPC();
    }
}

void TakeAndTeleport(object oPC)
{
    ClearAllActions();
    object oCrystal = GetItemPossessedBy(oPC, "x1towercrystal");
    if(oCrystal == OBJECT_INVALID)
        oCrystal = CreateItemOnObject("x1towercrystal", oPC);
    DestroyObject(oCrystal);
    DestroyCrystal(); // in case there are others
    Teleport(oPC);
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // petrify
    {
        object oActivePC = GetLocalObject(OBJECT_SELF, "ACTIVE_PC1");
        AssignCommand(oActivePC, ClearAllActions());
        effect ePoly = EffectPolymorph(43);
        effect eVis = EffectVisualEffect(VFX_IMP_HARM);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoly, OBJECT_SELF);
        effect eStone = EffectPetrify();
        object oPC = GetFirstPC();
        object oAnimal;
        object oFamiliar;
        object oDominated;
        object oSummoned;
        object oHenchman;
        effect eVis2 = EffectVisualEffect(VFX_DUR_PROT_STONESKIN);
        while(oPC != OBJECT_INVALID)
        {
            oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oPC);
            oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC);
            oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED,oPC);
            oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED,oPC);

            DestroyObject(oAnimal);
            DestroyObject(oFamiliar);
            DestroyObject(oDominated);
            DestroyObject(oSummoned);

            oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN,oPC);
            RemoveEffects(oHenchman);
            SetImmortal(oHenchman, FALSE);
            RemoveEffects(oPC);
            //AssignCommand(oHenchman, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
            //AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oPC);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oHenchman);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oHenchman);
            DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, oPC));

            // Applying effects again, just to make sure a player did not get away with that
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oPC));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oPC));
            oPC = GetNextPC();
        }
        //ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 0.5, 10.0);
        //AssignCommand(GetPCSpeaker(), SetCameraFacing(270.0, 12.0, 50.0, CAMERA_TRANSITION_TYPE_SLOW));
        //DelayCommand(14.0, StartNewModule("XP1-Chapter 2"));
        DelayCommand(3.0, TalkAgain(oActivePC));
    }
    else if(nEvent == 102) // take mythallar
    {
        object oActivePC = GetLocalObject(OBJECT_SELF, "ACTIVE_PC1");
        object oWP = GetWaypointByTag("Q4A_WP_TELEPORT");
        // Apply petrify again, just in case a player was able to break the previous one.
        effect eStone = EffectPetrify();
        object oPC = GetFirstPC();
        while(oPC != OBJECT_INVALID)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oPC);
            oPC = GetNextPC();
        }

        ClearAllActions(TRUE);
        AssignCommand(oActivePC, ClearAllActions(TRUE));
        ActionMoveToObject(oActivePC, FALSE, 0.0);
        ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.0);
        object oCrystal = GetItemPossessedBy(oActivePC, "x1towercrystal");
        if(oCrystal == OBJECT_INVALID)
            oCrystal = CreateItemOnObject("x1towercrystal", oActivePC);
        ActionDoCommand(DestroyObject(oCrystal));
        //AssignCommand(oActivePC, SpeakString("TODO: Take mythallar from player"));
        ActionMoveToObject(oWP, FALSE);
        ActionDoCommand(Teleport(oActivePC));
        DelayCommand(10.0, TakeAndTeleport(oActivePC)); // take mythalar and teleport in cast she gets stuck by something
    }
}
