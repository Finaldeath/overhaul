// * Sample script to cast an existing spell as is

void DoSpecialTrap(int nSpell)
{
    object oOrigin = GetNearestObjectByTag( GetTag(OBJECT_SELF) + "Shooter" );
    object oTarget = GetEnteringObject();

    if (GetIsObjectValid(oOrigin) == FALSE)
    {
        return;
        //oOrigin = OBJECT_SELF;
    }

    //SpeakString( GetName(oOrigin) + " -> " + GetName( oTarget ) );
    if (GetIsDM(oTarget) == FALSE)
        AssignCommand( oOrigin, ActionCastSpellAtObject(nSpell, oTarget, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE) );
}


void main()
{
    DoSpecialTrap(488);
}
