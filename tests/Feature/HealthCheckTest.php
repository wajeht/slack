<?php

it('should be able to reach healthz end point with json header', function() {
    $this->getJson('/healthz')
        ->assertHeader('Content-Type', 'application/json')
        ->assertJson(['message' => 'ok']);
});

it('should be able to reach healthz end point with html header', function() {
    $this->get('/healthz')
        ->assertHeader('Content-Type', 'text/html; charset=UTF-8')
        ->assertSee('ok');
});
