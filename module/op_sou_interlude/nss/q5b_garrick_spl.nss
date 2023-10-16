// if casting a healing spell on garrick - make him stand

void main()
{
    if(GetLastSpell() == 506 || // a healing kit
        GetLastSpell() == SPELL_CURE_CRITICAL_WOUNDS ||
        GetLastSpell() == SPELL_CURE_LIGHT_WOUNDS ||
        GetLastSpell() == SPELL_CURE_MINOR_WOUNDS ||
        GetLastSpell() == SPELL_CURE_MODERATE_WOUNDS ||
        GetLastSpell() == SPELL_CURE_SERIOUS_WOUNDS ||
        GetLastSpell() == SPELLABILITY_LAY_ON_HANDS)
    {
        object oPC = GetLastSpellCaster();
        SetLocalInt(oPC, "X1_HEALED_GARRCIK", 1);
        AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);
        object oTalker = GetNearestObjectByTag("Q5A_TALKER");
        DelayCommand(3.0, SetPlotFlag(OBJECT_SELF, FALSE));
        DelayCommand(3.0, AssignCommand(OBJECT_SELF, ClearAllActions()));
        DelayCommand(3.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 0.5, 99999.9)));
        DelayCommand(3.0, AssignCommand(OBJECT_SELF, SetFacingPoint(GetPosition(GetLastSpellCaster()))));
        DelayCommand(3.5, SetPlotFlag(OBJECT_SELF, TRUE));
        object oNurse = GetNearestObjectByTag("Q5A_NURSE");
        SetLocalInt(oNurse, "ANIMATED", ANIMATION_LOOPING_MEDITATE);
        object oFocus = GetNearestObjectByTag("FlameLarge");
        SetLocalObject(oNurse, "FOCUS", oFocus);
        AssignCommand(oNurse, ClearAllActions());
        object oWP = GetWaypointByTag("Q5B_WP_NURSE_SIT");
        DelayCommand(1.0, AssignCommand(oNurse, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 0.7)));
        DelayCommand(3.0, PlayVoiceChat(VOICE_CHAT_CHEER, oNurse));
        DelayCommand(2.0, AssignCommand(oNurse, ActionMoveToObject(oWP, FALSE, 0.0)));
        DelayCommand(4.0, AssignCommand(oNurse, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 9999.9)));
        DelayCommand(5.0, AssignCommand(oNurse, ActionDoCommand(SetFacingPoint(GetPosition(oFocus)))));
        DelayCommand(3.0, AssignCommand(oTalker, ActionStartConversation(oPC)));
    }
}
