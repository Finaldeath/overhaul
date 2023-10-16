// * each attack says a warning line if they take no damage
void main()
{
    if (GetTotalDamageDealt() == 0)
    {
        SetCommandable(TRUE);
        ClearAllActions();
        ActionSpeakStringByStrRef(66089);
        ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 780.0);
        SetCommandable(FALSE);
    }
}
