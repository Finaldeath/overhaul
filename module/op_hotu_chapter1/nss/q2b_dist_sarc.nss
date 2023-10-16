//When stuff is removed from the sarcophagus - destroy the shafts of light
//q2b_dist_sarc
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDestroySOL") == 1)
        return;

    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        SetLocalInt(OBJECT_SELF, "nDestroySOL", 1);

        object oSol1 = GetObjectByTag("q2b_sol_1");
        object oSol2 = GetObjectByTag("q2b_sol_2");

        SetPlotFlag(oSol1, FALSE);
        SetPlotFlag(oSol2, FALSE);

        DestroyObject(oSol1);
        DestroyObject(oSol2);
    }
}
