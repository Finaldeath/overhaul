void main()
{
    // * creates a firewall at WP_+<TAG>
    //WP_M_FireWall_1
    // * oNLY TURN ON WHEN PLAYER STEPS ACROSS MORAG
    // * INIT TRIGGER
    if (GetLocalInt(GetModule(), "NW_G_MORAGINITTRIG") == 10)
    if (GetLocalInt(OBJECT_SELF, "NW_L_DO_ONCE") == 0)
    {
        object oWay = GetNearestObjectByTag("WP_" + GetTag(OBJECT_SELF));
       // ActionCastSpellAtLocation(SPELL_BLADE_BARRIER, GetLocation(oWay), METAMAGIC_QUICKEN, TRUE);
        effect eAOE = EffectAreaOfEffect(AOE_PER_WALLBLADE, "m4blades");
        location lTarget = GetLocation(oWay);

        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, 7.0);
//        SetLocalInt(OBJECT_SELF, "NW_L_DO_ONCE",1);
    }
}
