<?php

it('should be able to reach healthz end point', function() {
    $this->getJson('/healthz')
        ->assertJson(['message' => 'ok']);
});
