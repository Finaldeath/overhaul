void main()
{
    if (!GetIsObjectValid(GetNearestObject()))
    {
        ActionCastSpellAtObject(134, OBJECT_SELF);
    }
}
