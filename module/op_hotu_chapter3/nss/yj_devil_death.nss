int CORPSE_CHANCE = 20; // out of 100 (chance of dropping a corpse)

void main()
{
     // Check to see if leaving a corpse
        int nRand = Random(100) + 1;
        if(nRand <= CORPSE_CHANCE)
            SetIsDestroyable(FALSE, FALSE, FALSE);
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
        DelayCommand(10.0, SetIsDestroyable(TRUE, FALSE, FALSE));
        DestroyObject(OBJECT_SELF, 11.0);
        //DestroyObject(OBJECT_SELF);
}
