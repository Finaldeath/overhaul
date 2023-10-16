// run away

void main()
{
    object oWorker = GetNearestObjectByTag("Q3A_WORKER");
    object oWP = GetWaypointByTag("Q3A_WP_WORKER_EXIT");
    object oWP2 = GetWaypointByTag("Q3A_WP_WORKER_JUMP");
    effect eff = GetFirstEffect(oWorker);
    while(GetIsEffectValid(eff))
    {
        RemoveEffect(oWorker, eff);
        eff = GetNextEffect(oWorker);
    }
    AssignCommand(oWorker, ClearAllActions());
    AssignCommand(oWorker, ActionForceMoveToObject(oWP, TRUE, 0.0, 10.0));
    AssignCommand(oWorker, ActionDoCommand(JumpToObject(oWP2)));
    DelayCommand(12.0, DestroyObject(oWorker));
    SetCommandable(FALSE, oWorker);
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_GOOD, 1 );
}
