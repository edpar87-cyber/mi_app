<?php
declare(strict_types=1);

use Migrations\BaseSeed;

/**
 * Articles seed.
 */
class ArticlesSeed extends BaseSeed
{
    /**
     * Run Method.
     *
     * Write your database seeder using this method.
     *
     * More information on writing seeds is available here:
     * https://book.cakephp.org/migrations/5/en/seeding.html
     *
     * @return void
     */
    public function run(): void
{
    $data = [
        [
            'title' => 'First Post',
            'slug' => 'first-post',
            'body' => 'This is my first blog post!',
            'published' => true,
            'created' => date('Y-m-d H:i:s'),
            'modified' => date('Y-m-d H:i:s'),
        ],
        [
            'title' => 'Second Post',
            'slug' => 'second-post',
            'body' => 'Another great article.',
            'published' => true,
            'created' => date('Y-m-d H:i:s'),
            'modified' => date('Y-m-d H:i:s'),
        ],
    ];
        $table = $this->table('articles');
        $table->insert($data)->save();
    }
}
