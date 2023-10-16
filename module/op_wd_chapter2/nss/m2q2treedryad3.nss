void main()
{
//* Display string for linked dryad

    string sNumber = GetStringRight(GetTag(OBJECT_SELF),1);

    object oDryad = GetObjectByTag("M2Q2CDRYAD" + sNumber);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),oDryad);
}
