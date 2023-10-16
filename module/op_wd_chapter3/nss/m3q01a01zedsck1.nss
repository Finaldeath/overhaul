int StartingConditional()
{
    if(GetLocalObject(OBJECT_SELF,"NW_G_M1Q00PLOTLEGHEALED")==GetPCSpeaker()
        || GetCurrentHitPoints() == GetMaxHitPoints())
    {
        return TRUE;
    }
    return FALSE;
}
