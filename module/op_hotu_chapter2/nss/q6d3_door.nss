// buff the apprentice

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oJansil = GetNearestObjectByTag("q6_jansil");

    AssignCommand(oJansil, ActionCastSpellAtObject(SPELL_PREMONITION,
        OBJECT_SELF, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    AssignCommand(oJansil, ActionCastSpellAtObject(SPELL_GREATER_SPELL_MANTLE,
        OBJECT_SELF, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    AssignCommand(oJansil, ActionCastSpellAtObject(SPELL_ENERGY_BUFFER,
        OBJECT_SELF, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    AssignCommand(oJansil, ActionCastSpellAtObject(SPELL_SHADOW_SHIELD,
        OBJECT_SELF, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

    // After this point, the player must deal with the apprentice or he would be found dead
    // next time the player returns to the area.
    SetLocalInt(oJansil, "FIGHT_STARTED", 1);
    ExecuteScript("x2_o2_dead", OBJECT_SELF);
}
