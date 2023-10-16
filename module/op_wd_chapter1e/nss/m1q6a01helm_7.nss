void main()
{
    int nHelmitesKilled = GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q6A01HelmitesKilled") + 1;
    SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q6A01HelmitesKilled",nHelmitesKilled);
    if(nHelmitesKilled >= 6)
    {
        SetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete",TRUE);
        SetLocalInt(GetModule(),"NW_G_M1Q6A01RitualInProgress",FALSE);
    }
}
