void main()
{

    int nDead = GetLocalInt(GetModule(),"NW_G_M1Q0CEnemiesDestroyed") + 1;
    SetLocalInt(GetModule(),"NW_G_M1Q0CEnemiesDestroyed", nDead);
    if (nDead >= 4)
    {
        SetLocalInt(GetModule(),"NW_PROLOGUE_PLOT",99);
        object oAribeth = GetNearestObjectByTag("M1Q0_ARIBETH");
        AssignCommand(oAribeth,ClearAllActions());
        AssignCommand(oAribeth,ActionMoveToObject(GetNearestObjectByTag("WP_Return_M1Q0_ARIBETH"),TRUE));
    }
}
