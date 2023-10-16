//q1rural_exit_dtg
//If the PC tries to avoid talking to Deekin - have him
//destroy himself and rearm his trigger

void main()
{
    object oDeekin = GetEnteringObject();
    if (GetTag(oDeekin) == "q6deekin")
    {
        AssignCommand(oDeekin, ClearAllActions(TRUE));
        object oDest = GetNearestObjectByTag("wp_deekinspawn");
        AssignCommand(oDeekin, ActionMoveToObject(oDest, TRUE));
        DestroyObject(oDeekin, 3.0);
        SetLocalInt(GetModule(), "X1_DeekinSpawn", 0);
    }

}
