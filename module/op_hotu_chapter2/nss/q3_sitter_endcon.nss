
void main()
{

        PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 99999.9);
        object oFocus = GetNearestObjectByTag("q3a_focus");
        SetFacingPoint(GetPosition(oFocus));
}
