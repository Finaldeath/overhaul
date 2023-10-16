void main()
{
int iEvent = GetUserDefinedEventNumber();

switch(iEvent)
    {
    case 1007:
        {
        //* When dead change into Intellect Devourer
/*July 22 2002: Making a tweaks so that this still works
with modules that were started before the patch.
 Using a local -- if I haven't spawned the intellect
 devourer at this point then try to.
  July 2 2002: Brent
   moved this code into a custom OnDeath script.
   The user defined death event may not always fire.
*/
    if (GetLocalInt(OBJECT_SELF, "NW_L_PATCHSPAWNID") == 0)
    {
        effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
        location lSpawn = GetLocation(OBJECT_SELF);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis,OBJECT_SELF);
        CreateObject(OBJECT_TYPE_CREATURE,"M1Q2_DEVOUR",lSpawn);
        }
        }
        break;
    }
}
