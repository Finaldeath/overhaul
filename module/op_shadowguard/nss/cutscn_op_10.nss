void PlayDead(object oGuard)
{
    if (GetLocalInt(oGuard, "N_STOP_PLAYING_DEAD") == 0)
    {
        AssignCommand(oGuard, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 3.0));

        AssignCommand(oGuard, DelayCommand(3.0, PlayDead(oGuard)));
    }

    else
        AssignCommand(oGuard, ClearAllActions());
}

void main()
{
    object oTarin = GetNearestObjectByTag("CS_OP_HENCH_TARI");

    object oGuard = GetNearestObjectByTag("CT_COMM_SH_STG1_1", oTarin);

    AssignCommand(oTarin, ActionEquipMostDamagingMelee());

    SetPlotFlag(oGuard, TRUE);

    SetLocalInt(oGuard, "N_DONT_DESTROY_ON_DEATH", 1);

    SetLocalInt(oGuard, "N_RAISE_WHEN_DEAD", 1);

    SetLocalInt(oGuard, "N_SELECT_WHEN_DEAD", 1);

    DelayCommand(2.0, AssignCommand(oTarin, ActionAttack(oGuard)));

    DelayCommand(4.0, AssignCommand(oTarin, ClearAllActions()));

    DelayCommand(3.0, PlayDead(oGuard));
}
