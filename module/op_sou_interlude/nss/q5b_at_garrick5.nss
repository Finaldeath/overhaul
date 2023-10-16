// use lay on hands

void main()
{
    object oGarrick = GetNearestObjectByTag("Q5B_GARRICK");
    SetCommandable(TRUE, oGarrick);
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, ActionPauseConversation());
    ActionPauseConversation();

    AssignCommand(oPC,ActionMoveToObject(oGarrick));
    DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0, 1.0)));

    effect eEffect = GetFirstEffect(oGarrick);
    DelayCommand(1.0, RemoveEffect(oGarrick, eEffect));


    talent tTalent = TalentFeat(FEAT_LAY_ON_HANDS);

    DelayCommand(1.0, AssignCommand(oPC, ActionUseTalentOnObject(tTalent, oGarrick)));

    DelayCommand(3.0, SetPlotFlag(oGarrick, FALSE));
    DelayCommand(3.0, AssignCommand(oGarrick, ClearAllActions()));
    DelayCommand(3.0, AssignCommand(oGarrick, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 0.5, 99999.9)));
    DelayCommand(3.3, AssignCommand(oGarrick, SetFacingPoint(GetPosition(oPC))));
    DelayCommand(3.5, SetPlotFlag(oGarrick, TRUE));
    DelayCommand(6.0, AssignCommand(oPC, ActionResumeConversation()));
}
