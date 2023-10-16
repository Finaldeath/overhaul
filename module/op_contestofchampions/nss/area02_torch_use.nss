void main()
{
    if ( GetLocalInt(OBJECT_SELF,"m_bActivated") == TRUE )
    {
        // Deactivate
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(OBJECT_SELF,"m_bActivated",FALSE);
    }
    else
    {
        // Activate
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocalInt(OBJECT_SELF,"m_bActivated",TRUE);
    }
}
