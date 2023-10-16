// cast a healing spell

void main()
{
    object oPC = GetPCSpeaker();
    //int nSpell = GetLocalInt(OBJECT_SELF, "SPELL");
    object oGarrick = GetNearestObjectByTag("Q5B_GARRICK");
    SetCommandable(TRUE, oGarrick);

    //effect eEffect = GetFirstEffect(oGarrick);
    //DelayCommand(5.0, RemoveEffect(oGarrick, eEffect));
    AssignCommand(oPC, ActionPauseConversation());
    SetPlotFlag(oGarrick, FALSE);
    talent tTalent = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20, oPC);
    if (GetIsTalentValid(tTalent) == TRUE)
    {
      AssignCommand(oPC, ActionUseTalentOnObject(tTalent, oGarrick));

    }

    DelayCommand(3.0, SetPlotFlag(oGarrick, FALSE));
    DelayCommand(3.0, AssignCommand(oGarrick, ClearAllActions()));
    DelayCommand(3.0, AssignCommand(oGarrick, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 0.5, 99999.9)));
    DelayCommand(3.3, AssignCommand(oGarrick, SetFacingPoint(GetPosition(oPC))));
    DelayCommand(3.5, SetPlotFlag(oGarrick, TRUE));
    object oNurse = GetNearestObjectByTag("Q5A_NURSE");
    SetLocalInt(oNurse, "ANIMATED", ANIMATION_LOOPING_MEDITATE);
    object oFocus = GetNearestObjectByTag("FlameLarge");
    SetLocalObject(oNurse, "FOCUS", oFocus);
    AssignCommand(oNurse, ClearAllActions());
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);
    object oWP = GetWaypointByTag("Q5B_WP_NURSE_SIT");
    DelayCommand(1.0, AssignCommand(oNurse, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 0.7)));
    DelayCommand(3.0, PlayVoiceChat(VOICE_CHAT_CHEER, oNurse));
    DelayCommand(2.0, AssignCommand(oNurse, ActionMoveToObject(oWP, FALSE, 0.0)));
    DelayCommand(4.0, AssignCommand(oNurse, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 9999.9)));
    DelayCommand(5.0, AssignCommand(oNurse, ActionDoCommand(SetFacingPoint(GetPosition(oFocus)))));
    DelayCommand(6.0, ActionResumeConversation());
    //AssignCommand(GetPCSpeaker(), ActionResumeConversation());

}
